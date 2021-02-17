'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class diagnostico_diabetes extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  diagnostico_diabetes.init({
    descripcion: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'diagnostico_diabetes',
  });
  return diagnostico_diabetes;
};