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
        foreignKey: 'nivel_glucosa_id'

      });
    }
  };
  nivel_glucosa.init({
    descripcion: DataTypes.STRING,
    escala: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'nivel_glucosa',
    freezeTableName: true,
    name: {
      singular: 'nivel_glucosa',
      plural: 'nivel_glucosa'
    }
  });
  return nivel_glucosa;
};