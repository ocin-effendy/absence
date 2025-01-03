<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Category;
use Illuminate\Support\Facades\Hash;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Illuminate\Support\Facades\Http;


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
            'image_url' => $request->image_url,
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
            'image_url' => $request->image_url,
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

    public function import(Request $request)
{
    $request->validate([
        'excel_file' => 'required|mimes:xlsx,xls|max:2048',
    ]);

    $file = $request->file('excel_file');
    $spreadsheet = IOFactory::load($file->getPathname());
    $sheet = $spreadsheet->getActiveSheet();
    $rows = $sheet->toArray(null, true, true, true);

    foreach ($rows as $index => $row) {
        if ($index == 1) continue;

        $category = Category::where('name', 'like', $row['D'])->first();


        if ($category) {
            User::updateOrCreate(
                ['email' => $row['B']],
                [
                    'name' => $row['A'],
                    'password' => bcrypt($row['C']),
                    'category_id' => $category->id,
                    'phone' => $row['E'],
                    'roles' => $row['F'],
                    'address' => $row['G'],
                    'gender' => $row['H'],
                    'image_url' => $row['I'],
                ]
            );
        } else {
            return back()->withErrors(['error' => "Kategori '{$row['D']}' tidak ditemukan pada baris {$index}."]);
        }
    }

    return back()->with('success', 'Users imported successfully. Duplicate entries updated.');
}



    public function updateFaceRecognition()
    {
        $users = User::select('id', 'name', 'image_url')->get();

        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        $sheet->setCellValue('A1', 'id');
        $sheet->setCellValue('B1', 'name');
        $sheet->setCellValue('C1', 'photo');

        $row = 2;
        foreach ($users as $user) {
            $sheet->setCellValue("A{$row}", $user->id);
            $sheet->setCellValue("B{$row}", $user->name);
            $sheet->setCellValue("C{$row}", $user->image_url);
            $row++;
        }

        $fileName = 'user_face_data.xlsx';
        $filePath = storage_path("app/{$fileName}");
        $writer = new Xlsx($spreadsheet);
        $writer->save($filePath);

        $apiKey = "gAAAAABncsWMh07zSvoUlaSDca0eiOdlaEIPp5TEZB5T-15GbM2kOF35FlOZzbFYCTWMp92KdtP14No4SecNU6HyZAm0gSa0Vt69nYXvHjNLHlkcDpBwLIroI-duMp6UWLOFmAqlgab2hTG99mcDZOK9o4N1_sCis4SR3t6X8CtzDoNDlIEvLq1t-AxVsK47g3vMs63ioP3WgaIJVxc9KRg5oYHJT1Ogp17VeJOYYw1Jqc1ZEqMlGs_1mxkcSENPEgcc9jNSM96MjpXYv-zScMYAX8JhJ3m47zojp7OWvXlfNyOqb7x2lIRIspLsI8nRy_4_FWgn1KltTvSny4y03Y--THxtooLphuX1ttbzJvdI3lnCxOgHb-NW1jTbFN33uXXLBKoFnfvdn0xHSXNOwPvWH2yfKfr5ZX9DNnP0ACeKZ2UMaheCvbyUOHwZnCv0fTDR98_hB1wkHww0bF0HSukVo9yS3EjORaAATmEiisDuVtLN-jrEGJAaeeU5wv0ULQtvv9UhQaWKQhdQ68Afp8YHx1c4OQ_t00SOsA-BeVEZW7T1xW7n3-IEoPTcm0jVfbu2GwapNzSwlxTVaS_uMGDa7mfW2VZVyscLO25Oc4UOLOmMGuRKCgkTpJMCz9iLVtqcbEqIN4PS";
        $headers = [
            'e-face-api-key' => $apiKey,
        ];

        $response = Http::withHeaders($headers)
            ->attach('excel_file', file_get_contents($filePath), $fileName)
            ->post('http://209.145.52.1:8000/bulk_register');

        unlink($filePath);

        if ($response->successful()) {
            return redirect()->back()->with('success', 'Face recognition updated successfully.');
        }

        return redirect()->back()->withErrors(['error' => 'Failed to update face recognition. Please try again.']);
    }
    
}
