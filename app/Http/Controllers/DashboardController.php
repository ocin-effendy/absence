<?php
namespace App\Http\Controllers;

use App\Models\Absence;
use App\Models\Attendance;
use App\Models\User;
use App\Models\Permission;

class DashboardController extends Controller
{
    public function index()
    {
        // Hitung jumlah data
        $totalAbsences = Absence::count();
        $totalUsers = User::count();
        $totalAttendances = Attendance::count();
        $totalPermissions = Permission::count();

        // Kirim data ke view
        return view('pages.dashboard', compact('totalAbsences', 'totalUsers', 'totalAttendances', 'totalPermissions'));
    }
}
