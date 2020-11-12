<?
namespace app\controllers;
use Yii;
use yii\data\ActiveDataProvider;
use app\models\User;
use yii\helpers\Url;
use yii\web\ServerErrorHttpException;
use yii\web\NotFoundHttpException;

class SiteController extends BaseController {
	public function actionIndex() {
		return new ActiveDataProvider([
			'query' => User::find(),
		]);
	}

	public function actionCreate() {
		$user = new User();
		return $this->saveModel($user);
	}

	public function actionUpdate($id) {
		$user = $this->findModel($id);
		return $this->saveModel($user);
	}

	public function actionView($id) {
		return $this->findModel($id);
	}

	public function saveModel($user) {
		if ($user->load(Yii::$app->getRequest()->getBodyParams(),'') && $user->save()) {
			$response = Yii::$app->getResponse();
			$response->setStatusCodde(201);
			$response->getHeaders()->set('Location', Url::toRoute(['view', 'id'=>$user->getPrimaryKey()], true));
		}
		elseif (!$user->hasErrors()) {
			throw new ServerErrorHttpException(serialize($user->getErrors()));
		}
		return $user;
	}

	public function findModel($id) {
		$user=User::findOne($id);
		if ($user===null) {
			throw new NotFoundHttpException("User with Id $id not found");
		}
		return $user;
	}
}