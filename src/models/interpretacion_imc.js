'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class interpretacion_imc extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      interpretacion_imc.hasMany(models.tamizaje,{
        foreignKey: 'interpretacion_imc_id'
      });
    }
  };
  interpretacion_imc.init({
    imc: DataTypes.INTEGER,
    intepretacion: DataTypes.STRING,
    recomendacion: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'interpretacion_imc',
    freezeTableName: true,
    name: {
      singular: 'interpretacion_imc',
      plural: 'interpretacion_imc'
    }
    
  });
  return interpretacion_imc;
};