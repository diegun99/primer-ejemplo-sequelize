'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class regimen_salud extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      regimen_salud.hasMany(models.entrevistado,{
        foreignKey: 'regimen_salud_id',
        as: 'entrevistado'
      });
    }
  };
  regimen_salud.init({
    descripcion: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'regimen_salud',
  });
  return regimen_salud;
};