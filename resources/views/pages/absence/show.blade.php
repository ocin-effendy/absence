@extends('layouts.app')

@section('title', 'Absence')

@push('style')
    <!-- CSS Libraries -->
    <link rel="stylesheet" href="{{ asset('library/summernote/dist/summernote-bs4.css') }}">
    <link rel="stylesheet" href="{{ asset('library/bootstrap-social/assets/css/bootstrap.css') }}">
@endpush

@section('main')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Detail Absence</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                    <div class="breadcrumb-item">Detail Absence</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Detail Absence</h2>
                <p class="section-lead">
                    Informasi tentang absensi.
                </p>

                <div class="row mt-sm-4">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-md-6 col-12">
                                        <label>Name</label>
                                        <p>{{ $absence->name }}</p>
                                    </div>
                                    <div class="form-group col-md-6 col-12">
                                        <label>Category</label>
                                        <p>{{ $absence->category->name }}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6 col-12">
                                        <label>Radius M</label>
                                        <p>{{ $absence->radius_m }} M</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6 col-12">
                                        <label>Latitude</label>
                                        <p>{{ $absence->latitude }}</p>
                                    </div>
                                    <div class="form-group col-md-6 col-12">
                                        <label>Longitude</label>
                                        <p>{{ $absence->longitude }}</p>
                                    </div>
                                </div>

                                <!-- Tampilkan semua sesi -->
                                <h5>Sesi Absensi</h5>
                                <div class="row">
                                    <!-- Sesi 1 -->
                                    <div class="form-group col-md-6 col-12">
                                        <label>Waktu Masuk (Sesi 1)</label>
                                        <p>{{ $absence->time_in }}</p>
                                    </div>
                                    <div class="form-group col-md-6 col-12">
                                        <label>Waktu Pulang (Sesi 1)</label>
                                        <p>{{ $absence->time_out }}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Sesi 2 -->
                                    <div class="form-group col-md-6 col-12">
                                        <label>Waktu Masuk (Sesi 2)</label>
                                        <p>{{ $absence->time_in_sesi2 ?? '-' }}</p>
                                    </div>
                                    <div class="form-group col-md-6 col-12">
                                        <label>Waktu Pulang (Sesi 2)</label>
                                        <p>{{ $absence->time_out_sesi2 ?? '-' }}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Sesi 3 -->
                                    <div class="form-group col-md-6 col-12">
                                        <label>Waktu Masuk (Sesi 3)</label>
                                        <p>{{ $absence->time_in_sesi3 ?? '-' }}</p>
                                    </div>
                                    <div class="form-group col-md-6 col-12">
                                        <label>Waktu Pulang (Sesi 3)</label>
                                        <p>{{ $absence->time_out_sesi3 ?? '-' }}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Sesi 4 -->
                                    <div class="form-group col-md-6 col-12">
                                        <label>Waktu Masuk (Sesi 4)</label>
                                        <p>{{ $absence->time_in_sesi4 ?? '-' }}</p>
                                    </div>
                                    <div class="form-group col-md-6 col-12">
                                        <label>Waktu Pulang (Sesi 4)</label>
                                        <p>{{ $absence->time_out_sesi4 ?? '-' }}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer text-right">
                                <a href="{{ route('absences.edit', $absence->id) }}" class="btn btn-primary">Edit Detail Absence</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection

@push('scripts')
    <!-- JS Libraries -->
    <script src="{{ asset('library/summernote/dist/summernote-bs4.js') }}"></script>

    <!-- Page Specific JS File -->
@endpush
