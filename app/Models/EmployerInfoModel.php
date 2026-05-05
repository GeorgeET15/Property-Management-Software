<?php

namespace App\Models;

use CodeIgniter\Model;

class EmployerInfoModel extends Model
{
    protected $table      = 'p_empinfo';
    protected $primaryKey = 'empinfo_id';
    protected $allowedFields = ['appinfo_id', 'emp_name', 'job_type', 'emp_address', 'emp_aphone', 'position', 'sup_name', 'job_duration', 'monthly_income', 'other_income'];
}
