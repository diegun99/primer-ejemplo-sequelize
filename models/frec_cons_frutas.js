'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class frec_cons_frutas extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      frec_cons_frutas.hasMany(models.tamizaje,{
        foreignKey: 'frec_cons_frutas_id'
 
      });
    }
  };
  frec_cons_frutas.init({
    descripcion: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'frec_cons_frutas',
    freezeTableName: true,
    name: {
      singular: 'frec_cons_frutas',
      plural: 'frec_cons_frutas'
    }
  });
  return frec_cons_frutas;
};