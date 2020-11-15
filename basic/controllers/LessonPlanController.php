<?php


namespace app\controllers;
use yii\data\ActiveDataProvider;
use app\models\LessonPlan;
use Yii;
use yii\helpers\Url;
use yii\web\ServerErrorHttpException;
use yii\web\NotFoundHttpException;
class LessonPlanController extends BaseController
{
    public function actionIndex(){
        return new ActiveDataProvider([
            'query' => LessonPlan::find(),
        ]);
    }
    public function actionCreate(){
        $lesson_plan = new LessonPlan();
        return $this->saveModel($lesson_plan);
    }
    public function actionUpdate($id){
        $lesson_plan = $this->findModel($id);
        return $this->saveModel($lesson_plan);
    }

    public function actionView($id){
        return $this->findModel($id);
    }

    public function findModel($id){
        $lesson_plan = LessonPlan::findOne($id);
        if ($lesson_plan === null) {

            throw new NotFoundHttpException("lesson_plan with $id not found");
        }
        return $lesson_plan;
    }
    public function saveModel($lesson_plan){
        if ($lesson_plan->loadAndSave(Yii::$app->getRequest()->getBodyParams())) {
            $respons = Yii::$app->getResponse();
            $respons->setStatusCode(201);
            $respons->getHeaders()->set('Location',
                Url::toRoute(['view', 'id' => $lesson_plan->getPrimaryKey()], true));
        } elseif (!$lesson_plan->hasErrors()) {
            throw new ServerErrorHttpException(serialize($lesson_plan->getErrors()));
        }
        return $lesson_plan;
    }
}