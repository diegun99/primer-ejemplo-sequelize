'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class imc extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      imc.hasMany(models.riesgo_diabetes, {
        foreignKey: 'imc_id'
      });
    }
  };
  imc.init({
    descripcion: DataTypes.STRING,
    escala: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'imc',
    
    freezeTableName: true,
    name: {
      singular: 'imc',
      plural: 'imc'
    }
  });
  return imc;
};