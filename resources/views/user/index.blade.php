@extends('layouts.app')

@section('title', 'Users')

@push('style')
    <!-- CSS Libraries -->
    <link rel="stylesheet"
        href="{{ asset('library/selectric/public/selectric.css') }}">
@endpush

@section('main')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Users</h1>
                <div class="section-header-button">
                    <a href="{{route('user.create')}}"
                        class="btn btn-primary">Add New</a>
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                    <div class="breadcrumb-item"><a href="#">Users</a></div>
                    <div class="breadcrumb-item">All Users</div>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-12">
                        @include('layouts.alert')
                    </div>
                </div>
                <h2 class="section-title">Users</h2>
                <p class="section-lead">
                    You can manage all users, such as editing, deleting and more.
                </p>


                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Users</h4>
                            </div>
                            <div class="col-12">

                            <form action="{{ route('users.import') }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="form-group">
                                    <label for="excel_file">Upload Excel File</label>
                                    <input type="file" name="excel_file" id="excel_file" class="form-control" required>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mt-3">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-upload"></i> Import Users
                                    </button>
                                    <a href="{{ route('user.updatefacerecognition') }}" class="btn btn-success">
                                        <i class="fas fa-download"></i> Update Face Recognition
                                    </a>
                                </div>
                            </form>

                            </div>

                            
                            <div class="card-body">
                                <div class="float-left">
                                    <form method="GET" action="{{ route('user.index') }}">
                                        <select name="category_id" class="form-control selectric" onchange="this.form.submit()">
                                            <option value="">Filter all Category</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}" 
                                                    {{ request('category_id') == $category->id ? 'selected' : '' }}>
                                                    {{ $category->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </form>
                                </div>

                                <div class="float-right">
                                    <form method="GET" action="{{ route('user.index') }}">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Search" name="name">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="clearfix mb-3"></div>

                                <div class="table-responsive">
                                    <table class="table-striped table">
                                        <tr>

                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Category</th>
                                            <th>Address</th>
                                            <th>Action</th>
                                        </tr>
                                        @foreach ($users as $user)
                                        <tr>
                                            <td>{{$user->name}}
                                            </td>
                                            <td>
                                                {{$user->email}}
                                            </td>
                                            <td>
                                                {{$user->phone}}
                                            </td>
                                            <td>
                                                {{$user->category->name ?? 'No Category'}}
                                            </td>

                                            <td>{{$user->address }}</td>

                                               <td>
                                                    <div class="d-flex justify-content-center">
                                                        <a href='{{ route('user.edit', $user->id) }}'
                                                            class="btn btn-sm btn-info btn-icon">
                                                            <i class="fas fa-edit"></i>
                                                            Edit
                                                        </a>

                                                        <form action="{{ route('user.destroy', $user->id) }}" method="POST"
                                                            class="ml-2">
                                                            <input type="hidden" name="_method" value="DELETE" />
                                                            <input type="hidden" name="_token"
                                                                value="{{ csrf_token() }}" />
                                                            <button class="btn btn-sm btn-danger btn-icon confirm-delete">
                                                                <i class="fas fa-times"></i> Delete
                                                            </button>
                                                        </form>
                                                    </div>
                                            </td>
                                        </tr>
                                        @endforeach


                                    </table>
                                </div>
                                <div class="float-right">
                                    {{ $users->withQueryString()->links() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@push('scripts')
    <!-- JS Libraies -->
    <script src="{{ asset('library/selectric/public/jquery.selectric.min.js') }}"></script>

    <!-- Page Specific JS File -->
    <script src="{{ asset('js/page/features-posts.js') }}"></script>
@endpush
