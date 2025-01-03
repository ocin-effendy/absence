<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Attendance;

class AttendanceController extends Controller
{
    //checkin
    public function checkin(Request $request)
    {
        //validate lat and long
        $request->validate([
            'user_id' => 'required',
            'absence_id' => 'required',
            'category_id' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
            'image' => 'required|image',
        ]);

        $imagePath = null; // inisialisasi default
        if ($request->hasFile('image')) {
            // Simpan gambar ke direktori storage/app/public/attendance_images
            $imagePath = $request->file('image')->store('attendance_images', 'public');
        }

        //save new attendance
        $attendance = new Attendance;
        $attendance->user_id = $request->user_id;
        $attendance->absence_id = $request->absence_id;
        $attendance->category_id = $request->category_id;
        $attendance->date = date('Y-m-d');
        $attendance->time = date('H:i:s');
        $attendance->latlon_in = $request->latitude;
        $attendance->latlon_out = $request->longitude;
        $attendance->image_url = $imagePath ? asset('storage/' . $imagePath) : null;
        $attendance->save();

        return response([
            'message' => 'Checkin success',
            'attendance' => $attendance
        ], 200);
    }

    //checkout
    public function checkout(Request $request)
    {
        //validate lat and long 
        $request->validate([
            'latitude' => 'required',
            'longitude' => 'required',
        ]);

        //get today attendance
        $attendance = Attendance::where('user_id', $request->user()->id)
            ->where('date', date('Y-m-d'))
            ->first();

        //check if attendance not found
        if (!$attendance) {
            return response(['message' => 'Checkin first'], 400);
        }

        //save checkout
        $attendance->time_out = date('H:i:s');
        $attendance->latlon_out = $request->latitude . ',' . $request->longitude;
        $attendance->save();

        return response([
            'message' => 'Checkout success',
            'attendance' => $attendance
        ], 200);
    }

    public function isCheckedin(Request $request)
    {
        $attendance = Attendance::where('user_id', $request->id)
            ->where('date', date('Y-m-d'))
            ->first();


        return response([
            'checkedin' => $attendance ? true : false,
        ], 200);
    }

    public function index(Request $request)
    {
        $date = $request->input('date');
    
        $query = Attendance::with(['absence']);
    
        if ($request->has('user_id')) {
            $query->where('user_id', $request->user_id);
        }
    
        if ($date) {
            $query->where('date', $date);
        }
    
        $attendances = $query->get();
    
        $result = $attendances->map(function ($attendance) {
            return [
                'id' => $attendance->id,
                'user_id' => $attendance->user_id,
                'category_id' => $attendance->category_id,
                'absence_id' => $attendance->absence_id,
                'date' => $attendance->date,
                'time' => $attendance->time,
                'latlon_in' => $attendance->latlon_in,
                'latlon_out' => $attendance->latlon_out,
                'absence_name' => $attendance->absence->name ?? null,
                'image_url' => $attendance->image_url,
            ];
        });
    
        return response()->json([
            'message' => 'Success',
            'data' => $result
        ], 200);
    }
}
