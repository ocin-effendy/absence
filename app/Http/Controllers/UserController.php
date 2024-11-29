<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Category;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

    public function index()
    {
        $categories = Category::all();

        $query = User::with('category');

        if (request('category_id')) {
            $query->where('category_id', request('category_id'));
        }

        if (request('name')) {
            $query->where('name', 'like', '%' . request('name') . '%');
        }

        $users = $query->orderBy('id', 'desc')->paginate(10);

        return view('user.index', compact('users', 'categories'));
    }


    //create
    public function create()
    {
        $categories = Category::all();
        return view('user.create', compact('categories'));
    }

    //store
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8',
            'category_id' => 'required|exists:category,id',

        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'roles' => $request->roles,
            'password' => Hash::make($request->password),
            'category_id' => $request->category_id,
            'address' => $request->address,
            'gender' => $request->gender,
        ]);

        return redirect()->route('user.index')->with('success', 'User created successfully');
    }

    //edit
    public function edit(User $user)
    {
        $categories = Category::all();
        return view('user.edit', compact('user', 'categories'));
    }


    //update
    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'category_id' => 'required|exists:category,id',
        ]);

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'roles' => $request->roles,
            'category_id' => $request->category_id,
            'address' => $request->address,
            'gender' => $request->gender,
        ]);

        //if password filled
        if ($request->password) {
            $user->update([
                'password' => Hash::make($request->password),
            ]);
        }

        return redirect()->route('user.index')->with('success', 'User updated successfully');
    }

    //destroy
    public function destroy(User $user)
    {
        $user->delete();
        return redirect()->route('user.index')->with('success', 'User deleted successfully');
    }
}
