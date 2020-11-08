<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property int $user_id
 * @property string $lastname
 * @property string $firstname
 * @property string|null $patronymic
 * @property string|null $login
 * @property string|null $pass
 * @property int $gender_id
 * @property string|null $birthday
 * @property int $role_id
 * @property int $active
 *
 * @property Student $student
 * @property Teacher $teacher
 * @property Gender $gender
 * @property Role $role
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['lastname', 'firstname', 'gender_id', 'role_id'], 'required'],
            [['gender_id', 'role_id', 'active'], 'integer'],
            [['birthday'], 'safe'],
            [['lastname', 'firstname', 'patronymic', 'login'], 'string', 'max' => 50],
            [['pass'], 'string', 'max' => 255],
            [['gender_id'], 'exist', 'skipOnError' => true, 'targetClass' => Gender::className(), 'targetAttribute' => ['gender_id' => 'gender_id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'role_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_id' => 'User ID',
            'lastname' => 'Lastname',
            'firstname' => 'Firstname',
            'patronymic' => 'Patronymic',
            'login' => 'Login',
            'pass' => 'Pass',
            'gender_id' => 'Gender ID',
            'birthday' => 'Birthday',
            'role_id' => 'Role ID',
            'active' => 'Active',
        ];
    }

    /**
     * Gets query for [[Student]].
     *
     * @return \yii\db\ActiveQuery|\app\models\queries\StudentQuery
     */
    public function getStudent()
    {
        return $this->hasOne(Student::className(), ['user_id' => 'user_id']);
    }

    /**
     * Gets query for [[Teacher]].
     *
     * @return \yii\db\ActiveQuery|\app\models\queries\TeacherQuery
     */
    public function getTeacher()
    {
        return $this->hasOne(Teacher::className(), ['user_id' => 'user_id']);
    }

    /**
     * Gets query for [[Gender]].
     *
     * @return \yii\db\ActiveQuery|\app\models\queries\GenderQuery
     */
    public function getGender()
    {
        return $this->hasOne(Gender::className(), ['gender_id' => 'gender_id']);
    }

    /**
     * Gets query for [[Role]].
     *
     * @return \yii\db\ActiveQuery|\app\models\queries\RoleQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['role_id' => 'role_id']);
    }

    /**
     * {@inheritdoc}
     * @return \app\models\queries\UserQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \app\models\queries\UserQuery(get_called_class());
    }

}
