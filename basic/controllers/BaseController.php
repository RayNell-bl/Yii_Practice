<?
use Controller;
use yii\filters\ContentNegotiator;
use yii\web\Response;
use yii\filters\auth\QueryParamAuth;
namespace app\controllers;



class BaseController extends Controller {
    public function behaviors() {
        return [
            'contentNegotiator' => [
            'class' => ContentNegotiator::class,
            'formats' => [
            'application/json' =>
            Response::FORMAT_JSON,
            ],
            ],
            'authenticator' => [
            'class' => QueryParamAuth::className(),
            'tokenParam' => 'token',
            ],
            ];
    }

    public $serializer = [
        'class' => 'yii\rest\Serializer',
        'collectionEnvelope' => 'items',
    ];
}

?>