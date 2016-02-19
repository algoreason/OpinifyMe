
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
        $(".spinner-container").removeClass('hide').addClass('show');
        $.ajax({
          url: url,
          success: function(response){
            if(response.next != null){
              $(".load-more-container").removeClass('hide').addClass('show');
              $(".spinner-container").removeClass('show').addClass('hide');
            }
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
        choicePanel = <ChoiceElement onVote={this.handleVoteButtonClick} key={"choices".concat(this.state.id)} choices = {this.props.data.choices} question_id = {this.props.data.id}/>;
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
                  <div className="row">
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
      "selected":null
    })
  },
  handleRadioClick: function (event) {
    this.setState({"selected":event.currentTarget.id});
    $("#button".concat(this.props.question_id)).removeClass('disabled').addClass('active');
  },
  handleClick: function (event) {
    // console.log(this.props.onVote(true));
    var setAsVoted = this.props.onVote;
    $.post("/api/vote/",
    {
        "question_id": this.props.question_id,
        "choice_id": this.state.selected
    },
    function(data, status){
        //alert("Data: " + data.results + "\nStatus: " + status);
        setAsVoted(true,data.results);

    });
  },
  render: function () {
    var choices = this.props.choices.map(function (item) {
      return(
        <div className="col-sm-6" key = {item.id}>
          <label><input id={item.id} type="radio" name="optradio" onClick={this.handleRadioClick}/>{" ".concat(item.text)}</label>
        </div>
      )
    }, this);
    return(
      <div>
        <form>
        {choices}
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
    // console.log({voted});
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