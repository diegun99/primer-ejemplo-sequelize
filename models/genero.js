'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class genero extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      genero.hasMany(models.entrevistado,{
        foreignKey: 'genero_id',
        as: 'entrevistado'
      });
    }
  };
  genero.init({
    descripcion: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'genero',
  });
  return genero;
};