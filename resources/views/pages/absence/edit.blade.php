@extends('layouts.app')

@section('title', 'Edit Absence')

@push('style')
    <!-- CSS Libraries -->
    <link rel="stylesheet" href="{{ asset('library/summernote/dist/summernote-bs4.css') }}">
    <link rel="stylesheet" href="{{ asset('library/bootstrap-social/assets/css/bootstrap.css') }}">
    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCr_2plXl3ymMrZmC1QYzYMpqBgEhf8gbM"></script> -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCr_2plXl3ymMrZmC1QYzYMpqBgEhf8gbM&libraries=places&callback=initMap" async defer></script>


    <style>
        #map {
            height: 500px;
            width: 100%;
        }
    </style>
    @endpush

@section('main')
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Edit Absence</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="#">Dashboard</a></div>
                    <div class="breadcrumb-item">Edit Absence</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Edit Absence</h2>
                <p class="section-lead">
                    Perbarui informasi tentang Absensi di halaman ini.
                </p>

                <div class="row mt-sm-4">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                        <form method="POST" action="{{ route('absences.update', $absence->id) }}">
                            @csrf
                            @method('PUT')
                            <div class="card-body">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <h4>Absensi dengan Lokasi</h4>
                                <div id="current-date" style="font-size: 14px; font-weight: bold;"></div>
                            </div>
                            <div class="form-group">
                                <label for="place-search">Search Location</label>
                                <input id="place-search" type="text" class="form-control" placeholder="Enter location">
                            </div>
                                <div id="map"></div>
                                <div class="row">
                                    <div class="form-group col-md-6 col-12">
                                        <label>Name</label>
                                        <input type="text" name="name" class="form-control" value="{{ $absence->name }}">
                                    </div>
                                    <div class="form-group col-md-6 col-12">
                                        <label>Category</label>
                                        <select class="form-control @error('category_id') is-invalid @enderror" name="category_id">
                                            <option value="">Select a Category</option>
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}"
                                                    {{ $absence->category_id == $category->id ? 'selected' : '' }}>
                                                    {{ $category->name }}
                                                </option>
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
                                        <input type="number" step="1" name="radius_m" class="form-control" value="{{ $absence->radius_m }}">
                                    </div>
                                </div>
                                <ul class="nav nav-tabs" id="sesiTabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="sesi1-tab" data-toggle="tab" href="#sesi1" role="tab" aria-controls="sesi1" aria-selected="true">Sesi 1</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sesi2-tab" data-toggle="tab" href="#sesi2" role="tab" aria-controls="sesi2" aria-selected="false">Sesi 2</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sesi3-tab" data-toggle="tab" href="#sesi3" role="tab" aria-controls="sesi3" aria-selected="false">Sesi 3</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="sesi4-tab" data-toggle="tab" href="#sesi4" role="tab" aria-controls="sesi4" aria-selected="false">Sesi 4</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="sesiTabsContent">
                                    <div class="tab-pane active" id="sesi1" role="tabpanel">
                                        <div class="row">
                                            <div class="form-group col-md-6 col-12">
                                                <label>Waktu Masuk</label>
                                                <input type="time" name="time_in" class="form-control" value="{{ $absence->time_in }}">
                                            </div>
                                            <div class="form-group col-md-6 col-12">
                                                <label>Waktu Pulang</label>
                                                <input type="time" name="time_out" class="form-control" value="{{ $absence->time_out }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="sesi2" role="tabpanel">
                                        <div class="row">
                                            <div class="form-group col-md-6 col-12">
                                                <label>Waktu Masuk</label>
                                                <input type="time" name="time_in_sesi2" class="form-control" value="{{ $absence->time_in_sesi2 }}">
                                            </div>
                                            <div class="form-group col-md-6 col-12">
                                                <label>Waktu Pulang</label>
                                                <input type="time" name="time_out_sesi2" class="form-control" value="{{ $absence->time_out_sesi2 }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="sesi3" role="tabpanel">
                                        <div class="row">
                                            <div class="form-group col-md-6 col-12">
                                                <label>Waktu Masuk</label>
                                                <input type="time" name="time_in_sesi3" class="form-control" value="{{ $absence->time_in_sesi3 }}">
                                            </div>
                                            <div class="form-group col-md-6 col-12">
                                                <label>Waktu Pulang</label>
                                                <input type="time" name="time_out_sesi3" class="form-control" value="{{ $absence->time_out_sesi3 }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="sesi4" role="tabpanel">
                                        <div class="row">
                                            <div class="form-group col-md-6 col-12">
                                                <label>Waktu Masuk</label>
                                                <input type="time" name="time_in_sesi4" class="form-control" value="{{ $absence->time_in_sesi4 }}">
                                            </div>
                                            <div class="form-group col-md-6 col-12">
                                                <label>Waktu Pulang</label>
                                                <input type="time" name="time_out_sesi4" class="form-control" value="{{ $absence->time_out_sesi4 }}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-6 col-12">
                                        <label>Latitude</label>
                                        <input type="text" id="latitude" name="latitude" class="form-control" readonly value="{{ $absence->latitude }}">
                                    </div>
                                    <div class="form-group col-md-6 col-12">
                                        <label>Longitude</label>
                                        <input type="text" id="longitude" name="longitude" class="form-control" readonly value="{{ $absence->longitude }}">
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer text-right">
                                <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
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
    // Fungsi untuk mendapatkan nama hari dalam Bahasa Indonesia
    function getDayName(dayIndex) {
        const days = [
            "Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"
        ];
        return days[dayIndex];
    }

    // Fungsi untuk mendapatkan nama bulan dalam Bahasa Indonesia
    function getMonthName(monthIndex) {
        const months = [
            "Januari", "Februari", "Maret", "April", "Mei", "Juni",
            "Juli", "Agustus", "September", "Oktober", "November", "Desember"
        ];
        return months[monthIndex];
    }

    // Fungsi untuk menampilkan tanggal saat ini
    function displayCurrentDate() {
        const now = new Date();
        const dayName = getDayName(now.getDay());
        const day = now.getDate();
        const monthName = getMonthName(now.getMonth());
        const year = now.getFullYear();

        const dateString = `${dayName}, ${day} ${monthName} ${year}`;
        document.getElementById("current-date").textContent = dateString;
    }

    // Panggil fungsi saat halaman dimuat
    document.addEventListener("DOMContentLoaded", displayCurrentDate);
</script>


<script>
        let map, autocomplete, marker;

        function initMap() {
            const lat = parseFloat(document.getElementById('latitude').value) || -6.200000;
            const lng = parseFloat(document.getElementById('longitude').value) || 106.816666;
            // const defaultLocation = { lat: -6.200000, lng: 106.816666 };
            const defaultLocation = { lat: lat, lng: lng };

            // Initialize map
            map = new google.maps.Map(document.getElementById("map"), {
                center: defaultLocation,
                zoom: 13,
            });

            // Initialize marker
            marker = new google.maps.Marker({
                map: map,
                position: defaultLocation,
                draggable: true,
            });

            //Autocomplete for the search field
            const input = document.getElementById("place-search");
            autocomplete = new google.maps.places.Autocomplete(input);

            // Restrict search to geographical location types
            autocomplete.setFields(["geometry", "name"]);

            // Listen for the place selection
            autocomplete.addListener("place_changed", () => {
                const place = autocomplete.getPlace();
                if (place.geometry) {
                    const location = place.geometry.location;
                    const lat = location.lat();
                    const lng = location.lng();

                    // Update map and marker
                    map.setCenter(location);
                    marker.setPosition(location);

                    // Update latitude and longitude fields
                    document.getElementById("latitude").value = lat;
                    document.getElementById("longitude").value = lng;
                } else {
                    alert("No details available for input: '" + place.name + "'");
                }
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

@endpush
