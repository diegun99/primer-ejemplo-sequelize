'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class riesgo_cardiovascular extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      this.belongsTo(models.calculo_rcv, {
        foreignKey: 'calculo_rcv_id'
      })
    }
  };
  riesgo_cardiovascular.init({
    diabetes: DataTypes.INTEGER,
    genero: DataTypes.INTEGER,
    fumador: DataTypes.INTEGER,
    presion_arterial: DataTypes.INTEGER,
    color: DataTypes.STRING,
    puntaje_base: DataTypes.INTEGER,
    calculo_rcv_id: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'riesgo_cardiovascular',
    freezeTableName: true,
    name: {
      singular: 'riesgo_cardiovascular',
      plural: 'riesgo_cardiovascular'
    }
  });
  return riesgo_cardiovascular;
};