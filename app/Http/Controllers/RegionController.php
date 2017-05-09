<?php

namespace App\Http\Controllers;

use App\DistrictRegion;
use App\ProvinceRegion;
use App\WardRegion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RegionController extends Controller
{
    //
    //Nation ---------------- Not yet support

    public function getProvinces(){
        $province = ProvinceRegion::all();
        return json_encode($province);
    }

    public function  getDistricts($provinceId){
        $district = DB::select('SELECT * FROM district_regions WHERE province_region_id = ?', [$provinceId]);
        return json_encode($district);;
    }

    public function  getWards($districtId){
        $district = DB::select('SELECT * FROM ward_regions WHERE district_region_id = ?', [$districtId]);
        return json_encode($district);
    }

}
