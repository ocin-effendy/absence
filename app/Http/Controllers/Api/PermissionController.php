<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Permission;

class PermissionController extends Controller
{
    //create
    public function store(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
            'absence_id' => 'required',
            'reason' => 'required',
            'image' => 'required|image',
        ]);


        $permission = new Permission();
        $permission->user_id = $request->user_id;
        $permission->date_permission = date('Y-m-d');
        $permission->reason = $request->reason;
        $permission->absence_id = $request->absence_id;
        $permission->is_approved = 0;


        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('permissions_images', 'public');
        }

        $permission->image = $imagePath ? asset('storage/' . $imagePath) : null;

        $permission->save();

        return response()->json(['message' => 'Success'], 201);
    }


    public function index(Request $request)
{
    $date = $request->input('date');

    $query = Permission::with(['user.category', 'absence']);

    if ($date) {
        $query->where('date_permission', $date);
    }

    $permissions = $query->get();

    $result = $permissions->map(function ($permission) {
        return [
            'id' => $permission->id,
            'user_id' => $permission->user->id ?? null,
            'user_name' => $permission->user->name ?? null,
            'category_name' => $permission->user->category->name ?? null,
            'absence_name' => $permission->absence->name ?? null,
            'date_permission' => $permission->date_permission,
            'reason' => $permission->reason,
            'image' => $permission->image,
            'is_approved' => $permission->is_approved,
        ];
    });

    return response()->json([
        'message' => 'Success',
        'data' => $result
    ], 200);
}


public function byUser(Request $request)
{
    $date = $request->input('date');

    $query = Permission::with(['user.category', 'absence']);

    if ($request->has('user_id')) {
        $query->where('user_id', $request->user_id);
    }

    if ($date) {
        $query->where('date_permission', $date);
    }

    $permissions = $query->get();

    $result = $permissions->map(function ($permission) {
        return [
            'id' => $permission->id,
            'user_id' => $permission->user->id ?? null,
            'user_name' => $permission->user->name ?? null,
            'category_name' => $permission->user->category->name ?? null,
            'absence_name' => $permission->absence->name ?? null,
            'date_permission' => $permission->date_permission,
            'reason' => $permission->reason,
            'image' => $permission->image,
            'is_approved' => $permission->is_approved,
        ];
    });

    return response()->json([
        'message' => 'Success',
        'data' => $result
    ], 200);
}
    

    public function byId(Request $request)
    {
        $date = $request->input('date');

        $query = Permission::with(['user.category', 'absence']);

        if ($request->has('id')) {
            $query->where('id', $request->id);
        }

        if ($date) {
            $query->where('date_permission', $date);
        }

        $permissions = $query->get();

        $result = $permissions->map(function ($permission) {
            return [
                'id' => $permission->id,
                'user_id' => $permission->user->id ?? null,
                'user_name' => $permission->user->name ?? null,
                'category_name' => $permission->user->category->name ?? null,
                'absence_name' => $permission->absence->name ?? null,
                'date_permission' => $permission->date_permission,
                'reason' => $permission->reason,
                'image' => $permission->image,
                'is_approved' => $permission->is_approved,
            ];
        });

        return response()->json([
            'message' => 'Success',
            'data' => $result
        ], 200);
    }


    public function approvePermission(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
        ]);

        $permission = Permission::find($request->id);

        if (!$permission) {
            return response()->json([
                'message' => 'Permission not found.',
            ], 404);
        }

        $permission->is_approved = 1;  // Set as approved
        $permission->approved_by = $request->user_id;  // Set the user who approved
        $permission->save();

        return response()->json([
            'message' => 'success',
            'data' => $permission
        ], 200);
    }
}
