<?php

namespace App\Helpers\Customer;

use App\Helpers\Customer\Traits\CustomerDeadlines;
use App\Models\Customer as CustomerModel;

class Customer
{

    use CustomerDeadlines;
    /*Begin::Customers*/
    public static function All()
    {
        return CustomerModel::all();
    }

    public static function LatestPaginate($quantity)
    {
        return CustomerModel::latest()
            ->paginate($quantity);
    }

    public static function Count()
    {
        return CustomerModel::count();
    }

    public static function Find($customer)
    {
        if ($find = CustomerModel::find($customer)) {
            return $find;
        } else return false;
    }

    public static function FindBySlug($slug)
    {
        if ($find = CustomerModel::where('slug', $slug)->first()) {
            return $find;
        } else return false;
    }
    /*End::Customers*/
}
