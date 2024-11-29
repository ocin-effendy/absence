<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AbsenceController;
use App\Http\Controllers\CategoryController;
use App\Exports\AttendancesExport;
use Maatwebsite\Excel\Facades\Excel;

Route::post('/login', [AuthController::class, 'login'])->name('login');

Route::get('/', function () {
    return view('auth.auth-login');
});

Route::get('/attendances/export', function () {
    return Excel::download(new AttendancesExport, 'attendances.xlsx');
})->name('attendances.export');


//jika sukses login masuk ke dashboard
Route::middleware(['auth'])->group(function () {
    Route::get('home', function () {
        return view('pages.dashboard', ['type_menu' => 'home']);
    })->name('home');
    Route::resource('user', UserController::class);
    Route::resource('companies', CompanyController::class);
    Route::resource('attendances', AttendanceController::class);
    Route::resource('permissions', PermissionController::class);
    Route::resource('absences', AbsenceController::class);
    Route::resource('categories', CategoryController::class);
});
