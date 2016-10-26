<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\ArticlesTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\ArticlesTable Test Case
 */
class ArticlesTableTest extends TestCase
{
    public $fixtures = ['app.articles']; 

    public function setUp()
    {
        parent::setUp();
        $this->Articles = TableRegistry::get('Articles');
    }  

    public function testFindStatus()
    {
        $query = $this->Articles->find('status');
        $this->assertInstanceOf('cake\ORM\Query', $query);
        $result = $query->hydrate(false)->toArray();
        $expected = [
            ['id' => 1, 'title' => 'First Article'],
            ['id' => 2, 'title' => 'Second Article'],
            ['id' => 3, 'title' => 'Third Article'],
        ];

        $this->assertEquals($expected, $result);
    }
}