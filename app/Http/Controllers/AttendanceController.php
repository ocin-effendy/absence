<?php

namespace App\Http\Controllers;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use App\Models\Attendance;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\User;
use Maatwebsite\Excel\Facades\Excel;
use PhpOffice\PhpSpreadsheet\Cell\Coordinate;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Color;

class AttendanceController extends Controller
{
    //index
    public function index(Request $request)
{
    $categories = Category::all();

    $query = Attendance::with(['user', 'category']);

    // Filter berdasarkan category_id
    if ($request->input('category_id')) {
        $query->where('category_id', $request->input('category_id'));
    }

    // Filter berdasarkan nama user
    if ($request->input('name')) {
        $query->whereHas('user', function ($query) use ($request) {
            $query->where('name', 'like', '%' . $request->input('name') . '%');
        });
    }

    // Filter harian (by specific date)
    if ($request->input('date')) {
        $query->whereDate('date', $request->input('date'));
    }

    // Filter bulanan (by specific month and year)
    if ($request->input('month')) {
        $query->whereMonth('date', date('m', strtotime($request->input('month'))))
              ->whereYear('date', date('Y', strtotime($request->input('month'))));
    }

    $attendances = $query->orderBy('id', 'desc')->paginate(10);

    return view('pages.absensi.index', compact('attendances', 'categories'));
}

    //edit
    public function edit($id)
    {
        $attendance = Attendance::with('user')->find($id);

        if (!$attendance) {
            return redirect()->route('attendances.index')->with('error', 'Attendance not found');
        }

        return view('pages.absensi.edit', compact('attendance'));
    }

    // Update
    // public function update(Request $request, $id)
    // {
    //     $attendance = Attendance::find($id);

    //     if (!$attendance) {
    //         return redirect()->route('attendances.index')->with('error', 'Attendance not found');
    //     }

    //     // Validasi input
    //     $request->validate([
    //         'date' => 'required|date',
    //         'time_in' => 'required|date_format:H:i',
    //         'time_out' => 'nullable|date_format:H:i',
    //         'latlon_in' => 'nullable|string',
    //         'latlon_out' => 'nullable|string'
    //     ]);

    //     // Update attendance
    //     $attendance->date = $request->input('date');
    //     $attendance->time_in = $request->input('time_in');
    //     $attendance->time_out = $request->input('time_out');
    //     $attendance->latlon_in = $request->input('latlon_in');
    //     $attendance->latlon_out = $request->input('latlon_out');
    //     $attendance->save();

    //     return redirect()->route('attendances.index')->with('success', 'Attendance updated successfully');
    // }

    // Destroy
    public function destroy($id)
    {
        $attendance = Attendance::find($id);

        if (!$attendance) {
            return redirect()->route('attendances.index')->with('error', 'Attendance not found');
        }

        $attendance->delete();

        return redirect()->route('attendances.index')->with('success', 'Attendance deleted successfully');
    }



public function exportExcel(Request $request)
{
    $month = $request->get('month') ?? date('Y-m');
    $year = date('Y', strtotime($month));
    $monthNumber = date('m', strtotime($month));

    $query = \App\Models\Attendance::with(['user', 'absence'])
        ->whereMonth('date', $monthNumber)
        ->whereYear('date', $year);

    if ($request->filled('category_id')) {
        $query->whereHas('user', function ($q) use ($request) {
            $q->where('category_id', $request->get('category_id'));
        });
    }

    if ($request->filled('name')) {
        $query->whereHas('user', function ($q) use ($request) {
            $q->where('name', 'like', '%' . $request->get('name') . '%');
        });
    }

    if ($request->filled('date')) {
        $query->whereDate('date', $request->get('date'));
    }

    $attendances = $query->get();

    $permissions = \App\Models\Permission::whereMonth('date_permission', $monthNumber)
        ->whereYear('date_permission', $year)
        ->get()
        ->groupBy('user_id');

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        
        // Tambahkan judul di atas tabel
        $sheet->setCellValue('A1', 'Rekap Absensi');
        $sheet->mergeCells('A1:AG1'); // Gabungkan sel untuk judul
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(16);
        $sheet->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
        
        // Tambahkan informasi filter di bawah judul
        $sheet->setCellValue('A2', 'Filter:');
        $sheet->mergeCells('A2:AG2');
        $sheet->getStyle('A2')->getFont()->setItalic(true);
        
        $filters = "Bulan: {$month}, ";
        if ($request->filled('category_id')) {
            $category = Category::find($request->get('category_id'));
            if ($category) {
                $filters .= "Kategori: {$category->name}, "; // Ganti 'name' dengan kolom yang sesuai di tabel Category
            }
        }
        if ($request->filled('name')) {
            $filters .= "Nama: {$request->get('name')}, ";
        }
        if ($request->filled('date')) {
            $filters .= "Tanggal: {$request->get('date')}";
        } else {
            $filters = rtrim($filters, ', ');
        }
        
        $sheet->setCellValue('A3', $filters);
        $sheet->mergeCells('A3:AG3');
        $sheet->getStyle('A3')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT);
        
        // Tambahkan header tabel di baris berikutnya
        $sheet->setCellValue('A5', 'ID');
        $sheet->setCellValue('B5', 'Name');
        for ($i = 1; $i <= 31; $i++) {
            $column = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 2);
            $sheet->setCellValue("{$column}5", $i);
            $sheet->getColumnDimension($column)->setWidth(5);
        }
        $sheet->getStyle('A5:AG5')->getFont()->setBold(true);
        
        // Mulai isi data dari baris ke-6
        $row = 6;
        $userAttendance = $attendances->groupBy('user_id');
        foreach ($userAttendance as $userId => $userData) {
            $sheet->setCellValue("A{$row}", $userId);
            $sheet->setCellValue("B{$row}", $userData->first()->user->name ?? 'Unknown');
        
            for ($i = 1; $i <= 31; $i++) {
                $column = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::stringFromColumnIndex($i + 2);
                $date = sprintf('%s-%02d-%02d', $year, $monthNumber, $i);
        
                // Check for permission on this date
                $userPermissions = $permissions[$userId] ?? collect();
                $hasPermission = $userPermissions->where('date_permission', $date)->isNotEmpty();
        
                if ($hasPermission) {
                    $sheet->getStyle("{$column}{$row}")->getFill()
                        ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                        ->getStartColor()->setARGB('FFFFFF00'); // Kuning
                    continue;
                }
        
                $dailyAttendance = $userData->where('date', $date);
        
                $isFullyPresent = false;
        
                if ($dailyAttendance->isNotEmpty()) {
                    $absenceIds = $dailyAttendance->pluck('absence_id')->unique();
        
                    $isFullyPresent = true;
                    foreach ($absenceIds as $absenceId) {
                        $absence = \App\Models\Absence::find($absenceId);
        
                        $expectedSessions = collect([
                            $absence->time_in,
                            $absence->time_out,
                            $absence->time_in_sesi2,
                            $absence->time_out_sesi2,
                            $absence->time_in_sesi3,
                            $absence->time_out_sesi3,
                            $absence->time_in_sesi4,
                            $absence->time_out_sesi4,
                        ])->filter()->count() / 2;
        
                        $attendedSessions = $dailyAttendance->where('absence_id', $absenceId)->count();
        
                        if ($attendedSessions < $expectedSessions) {
                            $isFullyPresent = false;
                            break;
                        }
                    }
                }
        
                if ($isFullyPresent) {
                    $sheet->getStyle("{$column}{$row}")->getFill()
                        ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                        ->getStartColor()->setARGB('FF00FF00'); // Hijau
                } else {
                    $sheet->getStyle("{$column}{$row}")->getFill()
                        ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                        ->getStartColor()->setARGB('FFFF0000'); // Merah
                }
            }
        
            $row++;
        }
        
        $writer = new Xlsx($spreadsheet);
        $filename = 'rekap_absensi.xlsx';
        
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header("Content-Disposition: attachment; filename=\"{$filename}\"");
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
        exit;
        
}


}
