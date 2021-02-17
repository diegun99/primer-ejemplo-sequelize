'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class riesgo_diabetes extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  riesgo_diabetes.init({
    puntaje_x_edad_id: DataTypes.INTEGER,
    imc_id: DataTypes.INTEGER,
    perim_abdomen_id: DataTypes.INTEGER,
    activ_fisica_id: DataTypes.INTEGER,
    entrevista_id: DataTypes.INTEGER,
    cons_frutas_id: DataTypes.INTEGER,
    medicamentos_hta_id: DataTypes.INTEGER,
    nivel_glucosa_id: DataTypes.INTEGER,
    familia_diabeticos_id: DataTypes.INTEGER,
    riesgo_diabetes: DataTypes.INTEGER,
    puntaje: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'riesgo_diabetes',
  });
  return riesgo_diabetes;
};