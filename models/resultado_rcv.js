'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class resultado_rcv extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      resultado_rcv.belongsTo(models.tamizaje_id);
      resultado_rcv.belongsTo(models.resultado_riesgo_cv)
    }
  };
  resultado_rcv.init({
    tamizaje_id: DataTypes.INTEGER,
    resultado_riesgo_cv: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'resultado_rcv',
  });
  return resultado_rcv;
};