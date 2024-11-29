<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Date</th>
            <th>Time In</th>
            <th>Time Out</th>
            <th>Latlong In</th>
            <th>Latlong Out</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($attendances as $attendance)
            <tr>
                <td>{{ $attendance->user->name }}</td>
                <td>{{ $attendance->category->name ?? 'N/A' }}</td>
                <td>{{ $attendance->date }}</td>
                <td>{{ $attendance->time_in }}</td>
                <td>{{ $attendance->time_out }}</td>
                <td>{{ $attendance->latlon_in }}</td>
                <td>{{ $attendance->latlon_out }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
