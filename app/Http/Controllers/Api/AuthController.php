<?php
    
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    //login
    public function login(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $loginData['email'])->first();

        if (!$user) {
            return response(['message' => 'Invalid credentials'], 401);
        }

        if (!Hash::check($loginData['password'], $user->password)) {
            return response(['message' => 'Invalid credentials'], 401);
        }

        return response()->json([
            'message' => 'Login Berhasil',
            'user' => $user,
        ], 200, [], JSON_PRETTY_PRINT);
    }

    public function logout(Request $request)
    {
        return response(['message' => 'Logged out'], 200);
    }


    public function updateProfile(Request $request){
        $request->validate([
            'id' => 'required',
            'address' => 'required',
            'phone' => 'required',
        ]);

        $user = User::find($request->id);

        $user->update([
            'address' => $request->address,
            'phone' => $request->phone,
        ]);

        return response()->json([
            'message' => 'Update Berhasil',
            'user' => $user,
        ], 200, [], JSON_PRETTY_PRINT);
    }
}
