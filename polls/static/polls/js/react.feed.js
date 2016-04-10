
/** @jsx React.DOM */
var next = "/api/feed?page=1"
var i = 0;
var data = {}

var FeedList = React.createClass({
      getInitialState: function(){
        return({
          "feed":[],
          "next":"",
          "previous":""
        })
      },
      loadFromServer: function (url) {
        $(".load-more-container").removeClass('show').addClass('hide');
        $("#feed-loader").removeClass('hide').addClass('show');
        $.ajax({
          url: url,
          success: function(response){
            if(response.next != null){
              $(".load-more-container").removeClass('hide').addClass('show');
            }
            $("#feed-loader").removeClass('show').addClass('hide');
            this.setState({
              feed: this.state.feed.concat(response.results),
              next: response.next,
              previous: response.previous
            });
          }.bind(this),
          error: function(xhr) {
            console.error(xhr.responseText);
          }.bind(this)
        });
      },
      componentDidMount: function () {
        this.loadFromServer(this.props.url);
      },
      handleClick: function () {
        this.loadFromServer(this.state.next);
      },
      render: function(){
        // console.log(this.state.feed)
        var feedItems = this.state.feed.map(function(item){
          return(
            <div className = "item">
              <FeedItem data = {item} key = {item.id}/>
            </div>
            )
          },this);
        return (
          <div className="feed-panel">
            <div className="panel-group" id="accordion">
              {feedItems}
            </div>
            <div className="load-more-container text-center">
              <button className="btn btn-primary load-more" onClick={this.handleClick}> Load More </button>
            </div>
            <div className="spinner-container text-center">
              <div className="mdl-spinner mdl-js-spinner is-active hide"></div>
            </div>
          </div>
          );
      }
    });

var FeedItem = React.createClass({
    getInitialState: function(){
      if(!this.props.data.is_voted){
        return({
          "voted":this.props.data.is_voted,
          "id":this.props.data.id,
          "results": []
        })
      }
      else{
        return({
          "voted":this.props.data.is_voted,
          "id":this.props.data.id,
          "results": this.props.data.results
        }) 
      }
    },
    handleVoteButtonClick: function(voted,results){
      
      this.setState({
        voted: voted,
        results: results
      });
    },
    render: function(){
      var style= {
        "padding":5,
        "margin":15,
        "textDecoration":"none"
      };
      var choicePanel;
      if(this.state.voted){
        choicePanel = <ResultElement results = {this.state.results} key={"result".concat(this.state.id)} question_id = {this.props.data.id}/>;
      }
      else{
        choicePanel = <ChoiceElement onVote={this.handleVoteButtonClick} key={"choices".concat(this.state.id)} choices = {this.props.data.choices} otherChoices={this.props.data.otherChoices} question_id = {this.props.data.id}/>;
      }
      return(
            <div style={style} className="panel panel-default">
              <a data-toggle="collapse" data-parent="#accordion" className="questions" href={"#ques".concat(this.props.data.id)}>
                <div className="panel-heading">
                  <div className="question-description">
                    {this.props.data.category} &bull; {this.props.data.modified}
                  </div>
                  <h4 className="panel-title">
                    {this.props.data.text}
                  </h4>
                  <askedBy is_voted={this.state.voted} user={this.props.data.author}/>
                </div>
              </a>
              <div id={"ques".concat(this.props.data.id)} className="panel-collapse collapse">
                <div className="panel-body">
                  <div style={{ "margin-right": 0, "margin-left": 0}} className="row">
                    {choicePanel}
                  </div>
                </div>
              </div>
            </div>
          );
    }
});

var ChoiceElement = React.createClass({
  getInitialState: function(){
    return({
      "selected":null,
      "choices":this.props.choices,
      "addOther":false,
      "newOption":null
    })
  },
  handleRadioClick: function (event) {
    this.handleHideOtherText();
    this.setState({"selected":event.currentTarget.id});
    $("#button".concat(this.props.question_id)).removeClass('disabled').addClass('active');
  },
  handleClick: function (event) {
    $("#button".concat(this.props.question_id)).removeClass('active').addClass('disabled');
    var setAsVoted = this.props.onVote;
    $.post("/api/vote/",
    { 
        "question_id": this.props.question_id,
        "choice_id": this.state.selected,
        "new_option": this.state.newOption
    },
    function(data, status){
        //console.log("data:"+data)
        //alert("Data: " + data.results + "\nStatus: " + status);
        setAsVoted(true,data.results);

    });
  },
  handleOtherClick: function(event){
    this.setState({"choices":this.state.choices.concat(this.props.otherChoices)});
    $("#other".concat(this.props.question_id)).addClass('hide');  
  },
  handleShowOtherText: function(event){
    this.setState({"addOther":true});
    if(this.state.selected!=null){
      //console.log("this is "+this.state.selected);
      $("#"+this.state.selected).prop('checked', false);
      this.setState({"selected":null});
      $("#button".concat(this.props.question_id)).removeClass('active').addClass('disabled');
    }
    $("#add-other".concat(this.props.question_id)).removeClass('show').addClass('hide');
    $("#remove-other".concat(this.props.question_id)).removeClass('hide').addClass('show')
  },
  handleHideOtherText: function(event){
    this.setState({"addOther":false,"newOption":null});
    $("#add-other".concat(this.props.question_id)).removeClass('hide').addClass('show');
    $("#remove-other".concat(this.props.question_id)).removeClass('show').addClass('hide');  
  },
  handleTextChangeInput: function(text){
    if(text != ""){
      this.setState({"newOption":text});
      $("#button".concat(this.props.question_id)).removeClass('disabled').addClass('active');
    }
    else{
      this.setState({"newOption":null});
      $("#button".concat(this.props.question_id)).removeClass('active').addClass('disabled');
    }
  },
  render: function () {
    var choices = this.state.choices.map(function (item) {
      return(
        <div className="col-sm-6" key = {item.id}>
          <label><input id={item.id} type="radio" name="optradio" onClick={this.handleRadioClick}/>{" ".concat(item.text)}</label>
        </div>
      )
    }, this);
    var otherChoicesLink;
    var hasOtherChoices = this.props.otherChoices.length > 0;
    if(hasOtherChoices){
      otherChoicesLink = <otherChoices onOtherClick={this.handleOtherClick} question_id = {this.props.question_id}/>
    }
    var otherChoicesText;
    if(this.state.addOther){
      otherChoicesText = <otherChoiceText onTextChange={this.handleTextChangeInput}/>;
    }
    return(
      <div>
        <form>
          <div className = "row">
            {choices}
            <div className="col-sm-6 hide">
              <label htmlFor={"text-choice".concat(this.props.question_id)}>Option:</label><br/>
              <input style={{"margin-left":"10"}} type="text" className="form-control" id={"text-choice".concat(this.props.question_id)}/>
            </div>
          </div>
          {otherChoicesLink}
          <div id={"add-options".concat(this.props.question_id)} className = "row">
            <div className = "col-sm-4"></div>
            <div className = "col-sm-7">
              <div id={"add-other".concat(this.props.question_id)}>
                <a href="javascript://" onClick={this.handleShowOtherText}>Add an option. </a><br/><br/>
              </div>
            </div>
          </div>
          {otherChoicesText}
          <div id={"remove-options".concat(this.props.question_id)} className = "row">
            <div className = "col-sm-5"></div>
            <div className = "col-sm-7">
              <div id={"remove-other".concat(this.props.question_id)} className = "hide">
                <a href="javascript://" onClick={this.handleHideOtherText}>Remove</a><br/><br/>
              </div>
            </div>
          </div>
          
        </form>

        <div className = "row">
          <div className = "col-sm-5"></div>
          <div className = "col-sm-7">
            <button id={"button".concat(this.props.question_id)} className="btn btn-primary disabled" onClick={this.handleClick}> Vote </button>
          </div>
        </div>
      </div>
    )  
  }
});

var otherChoices = React.createClass({
  handleClick: function () {
    var handleOtherClick = this.props.onOtherClick;
    handleOtherClick();
    $("#add-options".concat(this.props.question_id)).removeClass('hide').addClass('show');
  },
  componentDidMount: function () {
    $("#add-options".concat(this.props.question_id)).removeClass('show').addClass('hide');
  },
  render: function(){
    return(
     <div className = "row">
        <div className = "col-sm-4"></div>
        <div className = "col-sm-7">
          <div id={"other".concat(this.props.question_id)}>
            <a href="javascript://" onClick={this.handleClick}>Other Options </a><br/><br/>
          </div>
        </div>
      </div>
    )
  }
});

var otherChoiceText = React.createClass({
  componentDidMount: function () {
    $("#add-options".concat(this.props.question_id)).removeClass('show').addClass('hide');
  },
  handleOtherTextInput: function (event) {
    
    var textChangeTrigger = this.props.onTextChange;
    textChangeTrigger(event.target.value);
  },
  render: function(){
    return(
     <div className = "row">
        <div className = "col-sm-4"></div>
        <div className = "col-sm-7">
          <div id={"other-text".concat(this.props.question_id)}>
            <input type="text" placeholder="Add New Option" onChange={this.handleOtherTextInput}/>
          </div>
          <br/>
        </div>
      </div>
    )
  }
});

var ResultElement = React.createClass({
  render: function () {
    var results = this.props.results.map(function (item) {
      return(
        <div className="col-sm-6" key = {item.id}>
          <i className="zmdi zmdi-arrow-right"></i>
          {"  ".concat(item.text).concat(" - ").concat(item.votes)}
        </div>
      )
    }, this);
    return(
      <div>
        {results}
        <div className="col-sm-4"></div>
        <div className="col-sm-6">
          <a className="btn btn-primary" href={"/".concat(this.props.question_id).concat("/results/voted")}>View Details</a>
        </div>
      </div>
    )  
  }
});

var askedBy = React.createClass({
  
  render: function(){
    var voted;
    if(this.props.is_voted){
      voted = <votedElement/>
    }
    
    return(
      <div>
        <div className= "row">
          <div className="col-sm-4">
            {"".concat("asked by ").concat(this.props.user)}
          </div>
          <div className="col-sm-8">
            {voted}
          </div>
        </div>
      </div>
    )
  }
});

var votedElement = React.createClass({
  render: function () {
    var style = {
      "font-size":14,
      "background-color":"#0099ff",
      "color":"white"
    };
    return(
      <div>
        <span style={style}>
            {" ".concat("Voted").concat(" ")}
        </span>
      </div>
    )
  }
});

var categoriesElement = React.createClass({
  getInitialState: function(){
    return({
      "categories":[]
    })
  },
  loadFromServer: function (url) {
    $.ajax({
      url: url,
      success: function(response){
        this.setState({
          categories: this.state.categories.concat(response)
        });
      }.bind(this),
      error: function(xhr) {
        console.error(xhr.responseText);
      }.bind(this)
    });
  },
  componentDidMount: function () {
    this.loadFromServer('/api/categories');
  },
  render: function(){
    var categories = this.state.categories.map(function (item) {
    return(
        <div className="col-sm-6" key = {item.id}>
          <ul>
            <li><a href={"/categories/".concat(item.code)}>{item.text}</a></li>
          </ul>
        </div>
      )
    }, this);
    return(
    <div className="panel panel-primary">
    <div className="panel-heading">Popular Categories</div>
      <div className="panel-body">
      {categories}
      </div>
    </div> 
    )
  }
});

$(document).ready(function () {
  React.renderComponent(<FeedList url="/api/feed"/>, document.getElementById('feed-point'));
  React.renderComponent(<categoriesElement/>, document.getElementById('categories-point'));
});