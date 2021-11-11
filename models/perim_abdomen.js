'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class perim_abdomen extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      perim_abdomen.hasMany(models.riesgo_diabetes, {
        foreignKey: 'perim_abdomen_id'
      });
    }
  };
  perim_abdomen.init({
    genero: DataTypes.STRING,
    descripcion: DataTypes.STRING,
    escala: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'perim_abdomen',
    freezeTableName: true,
    name: {
      singular: 'perim_abdomen',
      plural: 'perim_abdomen'
    }
  });
  return perim_abdomen;
};