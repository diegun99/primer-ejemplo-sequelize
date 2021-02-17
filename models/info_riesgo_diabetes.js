'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class info_riesgo_diabetes extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  info_riesgo_diabetes.init({
    descripcion_puntaje: DataTypes.STRING,
    nivel_riesgo: DataTypes.STRING,
    mensaje: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'info_riesgo_diabetes',
  });
  return info_riesgo_diabetes;
};