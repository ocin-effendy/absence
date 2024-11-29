<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use Illuminate\Http\Request;
use App\Models\Category;
use Maatwebsite\Excel\Facades\Excel;

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
    public function update(Request $request, $id)
    {
        $attendance = Attendance::find($id);

        if (!$attendance) {
            return redirect()->route('attendances.index')->with('error', 'Attendance not found');
        }

        // Validasi input
        $request->validate([
            'date' => 'required|date',
            'time_in' => 'required|date_format:H:i',
            'time_out' => 'nullable|date_format:H:i',
            'latlon_in' => 'nullable|string',
            'latlon_out' => 'nullable|string'
        ]);

        // Update attendance
        $attendance->date = $request->input('date');
        $attendance->time_in = $request->input('time_in');
        $attendance->time_out = $request->input('time_out');
        $attendance->latlon_in = $request->input('latlon_in');
        $attendance->latlon_out = $request->input('latlon_out');
        $attendance->save();

        return redirect()->route('attendances.index')->with('success', 'Attendance updated successfully');
    }

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

    public function export()
    {
        Excel::create('Attendances', function ($excel) {
            $excel->sheet('Sheet 1', function ($sheet) {
                $attendances = Attendance::with('user', 'category')->get();

                $data = $attendances->map(function ($attendance) {
                    return [
                        'Name' => $attendance->user->name ?? 'N/A',
                        'Category' => $attendance->category->name ?? 'N/A',
                        'Date' => $attendance->date,
                        'Time In' => $attendance->time_in,
                        'Time Out' => $attendance->time_out,
                        'Latlong In' => $attendance->latlon_in,
                        'Latlong Out' => $attendance->latlon_out,
                    ];
                })->toArray();

                $sheet->fromArray($data);
            });
        })->export('xlsx');
    }
}
