'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class estrato_socioeconomico extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      estrato_socioeconomico.hasMany(models.entrevistado,{
        foreignKey: 'estrato_socioeconomico_id'
 
      });
    }
  };
  estrato_socioeconomico.init({
    descripcion: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'estrato_socioeconomico',
    freezeTableName: true,
    name: {
      singular: 'estrato_socioeconomico',
      plural: 'estrato_socioeconomico'
    }
  });
  return estrato_socioeconomico;
};