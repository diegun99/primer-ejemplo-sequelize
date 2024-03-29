'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class cons_frutas extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      cons_frutas.hasMany(models.riesgo_diabetes, {
        foreignKey: 'cons_frutas_id'
      });
    }
  };
  cons_frutas.init({
    frecuencia: DataTypes.STRING,
    escala: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'cons_frutas',
    freezeTableName: true,
    name: {
      singular: 'cons_frutas',
      plural: 'cons_frutas'
    }
  });
  return cons_frutas;
};