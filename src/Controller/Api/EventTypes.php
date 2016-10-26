<?php
namespace App\Controller\Api;

use App\Controller\Api\AppController;

class EventTypesController extends AppController
{
    public function initialize()
    {
        parent::initialize();
        $this->Auth->allow(['index', 'view']);
    }

    public $paginate = [
        'page' => 1,
        'limit' => 50,
        //'maxLimit' => 15,
        'sortWhitelist' => [
            'id', 'title'
        ]
    ];
}
