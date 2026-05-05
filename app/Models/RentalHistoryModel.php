<?php

namespace App\Models;

use CodeIgniter\Model;

class RentalHistoryModel extends Model
{
    protected $table      = 'p_rentalhistory';
    protected $primaryKey = 'rentalhistory_id';
    protected $allowedFields = ['appinfo_id', 'cur_address', 'curjobyear', 'cur_renamnt', 'cur_resleaving', 'curlname', 'for_address', 'forresyear', 'for_renamnt', 'for_resleaving', 'forlname', 'forland_phone'];
}
