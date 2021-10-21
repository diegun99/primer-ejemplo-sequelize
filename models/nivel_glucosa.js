'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class nivel_glucosa extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      nivel_glucosa.hasMany(models.riesgo_diabetes, {
        foreignKey: 'nivel_glucosa_id',
        as: 'riesgo_diabetes'

      });
    }
  };
  nivel_glucosa.init({
    descripcion: DataTypes.STRING,
    escala: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'nivel_glucosa',
  });
  return nivel_glucosa;
};