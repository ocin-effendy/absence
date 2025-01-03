<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


//login
Route::post('/login', [App\Http\Controllers\Api\AuthController::class, 'login']);
Route::post('/update-profile', [App\Http\Controllers\Api\AuthController::class, 'updateProfile']);

//logout
Route::post('/logout', [App\Http\Controllers\Api\AuthController::class, 'logout']);
//company
Route::get('/company', [App\Http\Controllers\Api\CompanyController::class, 'show']);
//checkin
Route::post('/checkin', [App\Http\Controllers\Api\AttendanceController::class, 'checkin']);
//checkout
Route::post('/checkout', [App\Http\Controllers\Api\AttendanceController::class, 'checkout']);
//is checkin
Route::get('/is-checkin', [App\Http\Controllers\Api\AttendanceController::class, 'isCheckedin']);
//update profile
Route::post('/update-profile', [App\Http\Controllers\Api\AuthController::class, 'updateProfile']);
//create permission
Route::apiResource('/api-permissions', App\Http\Controllers\Api\PermissionController::class);
Route::post('/api-permissions/checkin', [App\Http\Controllers\Api\PermissionController::class, 'store']);
Route::get('/permissions', [App\Http\Controllers\Api\PermissionController::class, 'index']);
Route::get('/permissions/by-user', [App\Http\Controllers\Api\PermissionController::class, 'byUser']);
Route::get('/permissions/by-id', [App\Http\Controllers\Api\PermissionController::class, 'byId']);

//notes
Route::apiResource('/api-notes', App\Http\Controllers\Api\NoteController::class);
//update fcm token
Route::post('/update-fcm-token', [App\Http\Controllers\Api\AuthController::class, 'updateFcmToken']);

//get attendance
Route::get('/api-attendances', [App\Http\Controllers\Api\AttendanceController::class, 'index']);

// get absence
Route::get('/api-absences', [App\Http\Controllers\Api\AbsenceController::class, 'getByCategory']);
Route::post('/api-absences/checkin', [App\Http\Controllers\Api\AttendanceController::class, 'checkin']);

Route::post('/api-permissions/approve', [App\Http\Controllers\Api\PermissionController::class, 'approvePermission']);

