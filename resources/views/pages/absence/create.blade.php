@extends('layouts.app')

@section('title', 'Add Absence')

@push('style')
    <!-- CSS Libraries -->
    <link rel="stylesheet" href="{{ asset('library/summernote/dist/summernote-bs4.css') }}">
    <link rel="stylesheet" href="{{ asset('library/bootstrap-social/assets/css/bootstrap.css') }}">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCr_2plXl3ymMrZmC1QYzYMpqBgEhf8gbM"></script>

    <style>
        #map {
            height: 500px;
            width: 100%;
        }
    </style>

<style>
    
</style>
@endpush

@section('main')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Add Absence</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                    <div class="breadcrumb-item">Add Absence</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Add Absence</h2>
                <p class="section-lead">
                    Tambah informasi tentang Absensi di halaman ini.
                </p>

                <div class="row mt-sm-4">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <form method="POST" action="{{ route('absences.store') }}">
                                @csrf
                                @method('POST')
                                <div class="card-body">
                                    <h4>Absensi dengan Lokasi</h4>
                                    <div id="map"></div>
                                    <div class="row">
                                        <div class="form-group col-md-6 col-12">
                                            <label>Name</label>
                                            <input type="text" name="name" class="form-control">
                                        </div>
                                        <div class="form-group col-md-6 col-12">
                                            <label>Category</label>
                                            <select class="form-control @error('category_id') is-invalid @enderror" name="category_id" required>
                                                <option value="" disabled selected>-- Select Category --</option>
                                                @foreach ($categories as $category)
                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                                @endforeach
                                            </select>
                                            @error('category_id')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6 col-12">
                                            <label>Radius M</label>
                                            <input type="number" step="1" name="radius_m" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6 col-12">
                                            <label>Waktu Masuk</label>
                                            <input type="time" name="time_in" class="form-control">
                                        </div>
                                        <div class="form-group col-md-6 col-12">
                                            <label>Waktu Pulang</label>
                                            <input type="time" name="time_out" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6 col-12">
                                            <label>Latitude</label>
                                            <input type="text" id="latitude" name="latitude" class="form-control" readonly>
                                        </div>
                                        <div class="form-group col-md-6 col-12">
                                            <label>Longitude</label>
                                            <input type="text" id="longitude" name="longitude" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer text-right">
                                    <button type="submit" class="btn btn-primary">Simpan Data</button>
                                </div>
                            </form>
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

    <script>
    let map, marker;

    function initMap() {
        const initialPosition = { lat: -6.200000, lng: 106.816666 };

        map = new google.maps.Map(document.getElementById("map"), {
            center: initialPosition,
            zoom: 13,
        });

        marker = new google.maps.Marker({
            position: initialPosition,
            map: map,
            draggable: true,
        });

        map.addListener("click", (event) => {
            const clickedLocation = event.latLng;

            marker.setPosition(clickedLocation);

            document.getElementById("latitude").value = clickedLocation.lat();
            document.getElementById("longitude").value = clickedLocation.lng();
        });
    }

    window.onload = initMap;
</script>




    <!-- Page Specific JS File -->
@endpush
