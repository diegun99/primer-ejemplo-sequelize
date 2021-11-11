'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class calculo_rcv extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      calculo_rcv.hasMany(models.riesgo_cardiovascular, {
        foreignKey: 'calculo_rcv_id'
      });
    }
  };
  calculo_rcv.init({
    porcentaje: DataTypes.INTEGER,
    nivel_riesgo: DataTypes.STRING,
    descripcion: DataTypes.STRING,
    color: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'calculo_rcv',
    freezeTableName: true,
    name: {
      singular: 'calculo_rcv',
      plural: 'calculo_rcv'
    }
  });
  return calculo_rcv;
};