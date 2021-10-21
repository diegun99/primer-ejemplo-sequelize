'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class medicamentos_hta extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      medicamentos_hta.hasMany(models.riesgo_diabetes, {
        foreignKey: 'medicamentos_hta_id',
        as: 'riesgo_diabetes'

      });
    }
  };
  medicamentos_hta.init({
    descripcion: DataTypes.STRING,
    escala: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'medicamentos_hta',
  });
  return medicamentos_hta;
};