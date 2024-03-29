'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class puntaje_x_edad extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      puntaje_x_edad.hasMany(models.riesgo_diabetes, {
        foreignKey: 'puntaje_x_edad_id'


      });
    }
  };
  puntaje_x_edad.init({
    rango_edad: DataTypes.STRING,
    escala: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'puntaje_x_edad',
    freezeTableName: true,
    name: {
      singular: 'puntaje_x_edad',
      plural: 'puntaje_x_edad'
    }
    
  });
  return puntaje_x_edad;
};