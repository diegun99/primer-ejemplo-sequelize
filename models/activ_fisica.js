'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class activ_fisica extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      activ_fisica.hasMany(models.riesgo_diabetes, {
        foreignKey: 'activ_fisica_id',
        as: 'riesgo_diabetes'

      });
    }
  };
  activ_fisica.init({
    descripcion: DataTypes.STRING,
    escala: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'activ_fisica',
  });
  return activ_fisica;
};