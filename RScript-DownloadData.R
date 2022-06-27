require("RPostgreSQL") #Hay que instalar el paquete: install.packages("RPostgreSQL")

drv <- dbDriver("PostgreSQL")
  
#Creamos la conexión a la base de datos
con <- dbConnect(drv, dbname = "ScadaWeb",
                     host = "155.54.236.10", port = 5432,
                     user = "aurora.gonzalez", password = "aurora.gonzalez")

#Listado de todas las tablas de la base de datos
#dbListTables(con)

#Para ver si existe una tabla
#dbExistsTable(con, c("Pleiades", "DispositivosHistoricos_302")) 


#Fechas para indicar de qué fechas hasta qué fecha descargamos
start_dt <- as.Date('2021-01-01 00:00:00',format="%Y-%m-%d %H:%M:%S")
end_dt <- as.Date('2021-01-15 00:00:00',format="%Y-%m-%d %H:%M:%S")


#Datos de los HVAC
#Seleccionamos las columnas V4(ON/OFF), V6(Velocidad del ventilador) y V12(Setpoint)
df_hvac <- dbGetQuery(con, paste('SELECT "DispositivosHistoricos_204"."ID",
                                    "DispositivosHistoricos_204"."IDdispositivo",
                                    "DispositivosHistoricos_204"."Fecha",
                                    "DispositivosHistoricos_204"."V4",
                                    "DispositivosHistoricos_204"."V6",
                                    "DispositivosHistoricos_204"."V12"
                      FROM "Pleiades"."DispositivosHistoricos_204" 
                      WHERE "DispositivosHistoricos_204"."Fecha" > \'', start_dt, '\'
                      AND "DispositivosHistoricos_204"."Fecha" < \'', end_dt, '\' '))

write.csv(df_hvac, file="data-hvac.csv", row.names = FALSE)
#df_hvac <- read.csv(file="data-hvac.csv")


#Datos de CONSUMO
#Seleccionamos la columna del consumo agregado(V22)
df_cons <- dbGetQuery(con, paste('SELECT "DispositivosHistoricos_302"."ID",
                                    "DispositivosHistoricos_302"."IDdispositivo",
                                    "DispositivosHistoricos_302"."Fecha",
                                    "DispositivosHistoricos_302"."V22"
                      FROM "Pleiades"."DispositivosHistoricos_302" 
                      WHERE "DispositivosHistoricos_302"."Fecha" > \'', start_dt, '\'
                      AND "DispositivosHistoricos_302"."Fecha" < \'', end_dt, '\' '))

write.csv(df_cons, file="data-cons.csv", row.names = FALSE)
#df_cons <- read.csv(file="data-cons.csv")


#Datos de SENSORES
#Seleccionamos la columna de la temperatura que registra el sensor(V2)
df_sensor <- dbGetQuery(con, paste('SELECT "DispositivosHistoricos_242"."ID",
                                    "DispositivosHistoricos_242"."IDdispositivo",
                                    "DispositivosHistoricos_242"."Fecha",
                                    "DispositivosHistoricos_242"."V2"
                      FROM "Pleiades"."DispositivosHistoricos_242" 
                      WHERE "DispositivosHistoricos_242"."Fecha" > \'', start_dt, '\'
                      AND "DispositivosHistoricos_242"."Fecha" < \'', end_dt, '\' '))

write.csv(df_sensor, file="data-sensor.csv", row.names = FALSE)
#df_sensor <- read.csv(file="data-sensor.csv")