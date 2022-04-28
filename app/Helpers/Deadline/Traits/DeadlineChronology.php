<?php

namespace App\Helpers\Deadline\Traits;

use App\Models\DeadlineChronology as ChronologyModel;

trait DeadlineChronology

{
    /*Begin::Chronologies*/
    public static function All($deadline)
    {
        return ChronologyModel::where('deadline_id', $deadline);
    }

    public static function LatestChronologiesPaginate($deadline, $quantity)
    {
        return self::All($deadline)
            ->latest()
            ->paginate($quantity);
    }

    public static function CountChronologies($deadline)
    {
        return self::All($deadline)->count();
    }

    public static function FindChronology($deadline, $chronology)
    {
        if ($chronology = self::All($deadline)->find($chronology)) {
            return $chronology;
        } else return false;
    }

    public static function AddChronology($data)
    {
        return ChronologyModel::create($data);
    }
    /*End::Chronologies*/
}
