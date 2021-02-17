'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class familia_diabeticos extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  familia_diabeticos.init({
    descripcion: DataTypes.STRING,
    escala: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'familia_diabeticos',
  });
  return familia_diabeticos;
};