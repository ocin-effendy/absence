<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AbsenceController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DashboardController;
use App\Exports\AttendancesExport;
use Maatwebsite\Excel\Facades\Excel;

Route::post('/login', [AuthController::class, 'login'])->name('login');

Route::get('/', function () {
    return view('auth.auth-login');
});

Route::get('/attendances/export', [AttendanceController::class, 'exportExcel'])->name('attendances.export');
Route::get('user/updatefacerecognition', [UserController::class, 'updateFaceRecognition'])->name('user.updatefacerecognition');




//jika sukses login masuk ke dashboard
Route::middleware(['auth'])->group(function () {
    Route::middleware(['auth'])->group(function () {
        Route::get('home', [DashboardController::class, 'index'])->name('home');
        // Rute lainnya...
    });
    
    Route::resource('user', UserController::class);
    Route::resource('companies', CompanyController::class);
    Route::resource('attendances', AttendanceController::class);
    Route::resource('permissions', PermissionController::class);
    Route::resource('absences', AbsenceController::class);
    Route::resource('categories', CategoryController::class);

    Route::post('users/import', [UserController::class, 'import'])->name('users.import');

});
