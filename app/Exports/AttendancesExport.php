<?php

namespace App\Exports;

use App\Models\Attendance;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class AttendancesExport implements FromCollection, WithHeadings
{
    /**
     * Retrieve data for export.
     */
    public function collection()
    {
        return Attendance::with(['user', 'category'])
            ->get()
            ->map(function ($attendance) {
                return [
                    'Name' => $attendance->user->name,
                    'Date' => $attendance->date,
                    'Category' => $attendance->category->name ?? 'No Category',
                    'Time' => $attendance->time,
                    'Latlong In' => $attendance->latlon_in,
                    'Latlong Out' => $attendance->latlon_out,
                ];
            });
    }

    /**
     * Define headings for the Excel file.
     */
    public function headings(): array
    {
        return [
            'Name',
            'Date',
            'Category',
            'Time',
            'Latlong In',
            'Latlong Out',
        ];
    }
}
