<?php

namespace App\Models;

use CodeIgniter\Model;

class GivingAnswerModel extends Model
{
    protected $table      = 'p_givinganswer';
    protected $primaryKey = 'givinganswer_id';
    protected $allowedFields = ['appinfo_id', 'dec_bankrupcy', 'evicted_residence', 'rental_due', 'refused_rent', 'con_felony', 'sex_offence', 'drug_crime', 'parole'];
}
