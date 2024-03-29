'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class tipo_documento extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      tipo_documento.hasMany(models.entrevistado,{
        foreignKey: 'tipo_documento_id',

      });
    
    }
  };
  tipo_documento.init({
    descripcion: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'tipo_documento',
    freezeTableName: true,
    name: {
      singular: 'tipo_documento',
      plural: 'tipo_documento'
    }
  });
  return tipo_documento;
};