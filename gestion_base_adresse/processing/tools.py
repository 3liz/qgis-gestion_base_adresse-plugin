from qgis.PyQt.QtCore import QCoreApplication
from db_manager.db_plugins.plugin import BaseError
from db_manager.db_plugins import createDbPlugin
from db_manager.db_plugins.postgis.connector import PostGisDBConnector

def tr(string):
    return QCoreApplication.translate('Processing', string)

def getVersionInteger(f):
    '''
    Transform "0.1.2" into "000102"
    Transform "10.9.12" into "100912"
    to allow comparing versions
    and sorting the upgrade files
    '''
    return ''.join([a.zfill(2) for a in f.strip().split('.')])


def getUriFromConnectionName(connection_name, must_connect=True):

    # Otherwise check QGIS QGIS3.ini settings for connection name
    status = True
    uri = None
    error_message = ''
    connection = None
    try:
        dbpluginclass = createDbPlugin( 'postgis', connection_name )
        connection = dbpluginclass.connect()
    except BaseError as e:
        status = False
        error_message = e.msg
    except:
        status = False
        error_message = tr('Cannot connect to database with') + ' %s' % connection_name

    if not connection and must_connect:
        return status, uri, error_message

    db = dbpluginclass.database()
    if not db:
        status = False
        error_message = tr('Unable to get database from connection')
        return status, uri, error_message

    uri = db.uri()
    return status, uri, ''

def fetchDataFromSqlQuery(connection_name, sql):

    header = None
    data = []
    header = []
    rowCount = 0
    error_message = None
    connection = None
    ok = True

    # Get URI
    status, uri, error_message = getUriFromConnectionName(connection_name)

    if not uri:
        ok = False
        return header, data, rowCount, ok, error_message
    try:
        connector = PostGisDBConnector(uri)
    except:
        error_message = tr('Cannot connect to database')
        ok = False
        return header, data, rowCount, ok, error_message

    c = None
    ok = True
    #print "run query"
    try:
        c = connector._execute(None,str(sql))
        data = []
        header = connector._get_cursor_columns(c)
        if header == None:
            header = []
        if len(header) > 0:
            data = connector._fetchall(c)
        rowCount = c.rowcount
        if rowCount == -1:
            rowCount = len(data)

    except BaseError as e:
        ok = False
        error_message = e.msg
        return header, data, rowCount, ok, error_message
    finally:
        if c:
            c.close()
            del c

    # Log errors
    if not ok:
        error_message = tr('Unknown error occured while fetching data')
        return header, data, rowCount, ok, error_message
        print(error_message)
        print(sql)

    return header, data, rowCount, ok, error_message
