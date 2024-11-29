<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        // Validasi input
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        // Cari user berdasarkan email
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return back()->withErrors([
                'email' => 'Email not found.',
            ])->withInput();
        }

        // Cek apakah password sesuai dan roles adalah ADMIN
        if (Hash::check($request->password, $user->password) && $user->roles === 'admin') {
            // Loginkan user
            Auth::login($user);

            // Redirect ke halaman dashboard atau halaman lain sesuai kebutuhan
            return redirect()->route('home')->with('success', 'Login successful.');
        }

        // Jika password salah atau roles bukan ADMIN
        return back()->withErrors([
            'email' => 'Invalid credentials or you are not an admin.',
        ])->withInput();
    }
}
