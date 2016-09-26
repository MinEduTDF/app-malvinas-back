<?php
namespace App\Controller\Api;

use App\Controller\Api\AppController;

class CategoriesController extends AppController
{
    public $paginate = [
        'page' => 1,
        'limit' => 50,
        //'maxLimit' => 15,
        'sortWhitelist' => [
            'id', 'title'
        ]
    ];
}
