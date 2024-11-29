<?php

namespace App\Exports;

use App\Models\Attendance;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class AttendancesExport implements FromCollection, WithHeadings
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        // You can modify the query to filter based on request data, if needed
        return Attendance::with('user', 'category') // eager load related models
            ->get()
            ->map(function ($attendance) {
                return [
                    $attendance->user->name,
                    $attendance->date,
                    $attendance->category->name ?? 'No Category',
                    $attendance->time_in,
                    $attendance->time_out,
                    $attendance->latlon_in,
                    $attendance->latlon_out,
                ];
            });
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'Name',
            'Date',
            'Category',
            'Time In',
            'Time Out',
            'Latlong In',
            'Latlong Out',
        ];
    }
}
